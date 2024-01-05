{
  "properties" : { },
  "id" : "8cb3beab4c7548079c0231c28cff7c65",
  "script" : null,
  "groupId" : "04d038253686473686a550caa1469ee6",
  "name" : "服务器信息",
  "createTime" : null,
  "updateTime" : 1704417383837,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/server",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "monitor:server:view",
    "description" : "允许拥有该权限的访问",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 402,\n    \"data\": null,\n    \"message\": \"登录已超时，请重新登录\"\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
import 'oshi.SystemInfo'
import 'oshi.util.Util'
import 'oshi.hardware.CentralProcessor'
import 'cn.hutool.core.io.FileUtil'
import 'cn.hutool.core.util.NumberUtil';
import 'cn.hutool.system.SystemUtil';
import 'cn.hutool.core.net.NetUtil';
import 'cn.hutool.core.date.DateUtil';
import 'java.math.BigDecimal';
import 'java.lang.management.ManagementFactory';
import 'cn.hutool.core.date.BetweenFormatter';
import 'org.ssssssss.magicboot.utils.RuntimeUtils';


var si = new SystemInfo()
var hal = si.getHardware();
var cpu = hal.getProcessor();

var cpuInfo = {
    name: cpu.processorIdentifier.name,
    physicalNum: cpu.physicalPackageCount, // 物理CPU
    physicalCoreNum: cpu.physicalProcessorCount, // 物理核心
    logicalCoreNum: cpu.logicalProcessorCount //逻辑核心
}

var prevTicks = cpu.getSystemCpuLoadTicks(); // long[]
Util.sleep(1000);

var ticks = cpu.getSystemCpuLoadTicks(); // long[]

var TickType = CentralProcessor.TickType
var nice = ticks[TickType.NICE.index] - prevTicks[TickType.NICE.index];
var irq = ticks[TickType.IRQ.index] - prevTicks[TickType.IRQ.index];
var softIrq = ticks[TickType.SOFTIRQ.index] - prevTicks[TickType.SOFTIRQ.index];
var steal = ticks[TickType.STEAL.index] - prevTicks[TickType.STEAL.index];
var sys = ticks[TickType.SYSTEM.index] - prevTicks[TickType.SYSTEM.index];
var user = ticks[TickType.USER.index] - prevTicks[TickType.USER.index];
var ioWait = ticks[TickType.IOWAIT.index] - prevTicks[TickType.IOWAIT.index];
var idle = ticks[TickType.IDLE.index] -  prevTicks[TickType.IDLE.index];
var totalCpu = user + nice + sys + idle + ioWait + irq + softIrq + steal;

cpuInfo.sysUseRate = NumberUtil.div(NumberUtil.mul(sys, 100), totalCpu, 2) + "%"
cpuInfo.userUseRate = NumberUtil.div(NumberUtil.mul(user, 100), totalCpu, 2) + "%"
cpuInfo.totalUseRate = NumberUtil.div(NumberUtil.mul(NumberUtil.add(sys, user), 100), totalCpu, 2)
cpuInfo.waitRate = NumberUtil.div(NumberUtil.mul(ioWait, 100), totalCpu, 2) + "%"
cpuInfo.freeRate = NumberUtil.div(NumberUtil.mul(idle, 100), totalCpu, 2) + "%"

// 内存信息
var memory = hal.getMemory();
var menmTotal = memory.getTotal();
var memAvailable = memory.getAvailable();
var used = menmTotal - memAvailable;

var memoryInfo = {
    total: FileUtil.readableFileSize(menmTotal),
    used: FileUtil.readableFileSize(used),
    free: FileUtil.readableFileSize(memAvailable),
    useRate: NumberUtil.mul(NumberUtil.div(used, menmTotal, 4), 100)
}

 // 存储信息
var storageTotal = 0
var storageUsed = 0
var storageFree = 0

for (item in si.operatingSystem.fileSystem.fileStores) {
    storageTotal += item.totalSpace
    storageUsed +=  (item.totalSpace - item.usableSpace)
    storageFree += item.freeSpace
}

 var storageInfo = { 
     total: FileUtil.readableFileSize(storageTotal),
     useed: FileUtil.readableFileSize(storageUsed),
     free: FileUtil.readableFileSize(storageFree),
     useRate: NumberUtil.mul(NumberUtil.div(storageUsed, storageTotal, 4), 100)
};

// 服务器信息
var osInfo = SystemUtil.getOsInfo()

var serverInfo = {
    name: NetUtil.localHostName,
    os: osInfo.name,
    ip: NetUtil.localhostStr,
    arch: osInfo.arch,
};

 // JVM信息
var runtimeInfo = SystemUtil.runtimeInfo
var vmInfo = SystemUtil.jvmInfo
var totalMemory = runtimeInfo.totalMemory
var jvmMemoryUsed = NumberUtil.sub(new BigDecimal(totalMemory), new BigDecimal(runtimeInfo.freeMemory)).longValue();
var javaRuntimeInfo = SystemUtil.javaRuntimeInfo;
var startTime = new Date(RuntimeUtils.getJavaVMStartTime()); 

var jvmInfo = {
    name: vmInfo.name,
    version: vmInfo.version,
    memoryTotal: FileUtil.readableFileSize(totalMemory),
    memoryFree: FileUtil.readableFileSize(runtimeInfo.freeMemory),
    memoryUsed: FileUtil.readableFileSize(jvmMemoryUsed),
    useRate: NumberUtil.mul(NumberUtil.div(jvmMemoryUsed, totalMemory, 4), 100),
    startTime: date_format(startTime, 'yyyy-MM-dd HH:mm:ss'),
    runTime: DateUtil.formatBetween(startTime, new Date(), BetweenFormatter.Level.SECOND),
    javaVersion: javaRuntimeInfo.version,
    javaPath: javaRuntimeInfo.homeDir
};

return {
    cpu: cpuInfo,
    memory: memoryInfo,
    storage: storageInfo,
    server: serverInfo,
    jvm: jvmInfo
};