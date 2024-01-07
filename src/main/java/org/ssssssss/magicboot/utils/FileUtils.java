package org.ssssssss.magicboot.utils;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import org.springframework.web.multipart.MultipartFile;
import org.ssssssss.magicboot.model.Global;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;

public class FileUtils {

    public static Map<String, Object> saveFile(MultipartFile file, String bizType) {
        return saveBaseFile(file.getOriginalFilename(), bizType, newFile -> {
            try {
                file.transferTo(newFile);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        });
	}


    public static Map<String, Object> saveBaseFile(String originalFilename, String bizType, Consumer<File> fn) {
        String dir = Global.USER_FILES_BASE_URL + bizType + "/" +  DateUtil.format(new Date(), DatePattern.PURE_DATE_PATTERN) + "/";
        String suffix = FileUtil.getSuffix(originalFilename);
        String fileName = IdUtil.fastSimpleUUID() + "." + suffix;

        String realPath = Global.getUserFilesBaseDir() +  dir + fileName;
        realPath = FileUtil.normalize(realPath);
        File realFile = new File(realPath);

        if (!realFile.getParentFile().exists()) {
            realFile.getParentFile().mkdirs();
        }

        Map<String, Object> result = new HashMap<>();

        try {
            fn.accept(realFile);
        } catch (Exception exception) {
            result.put("success", false);
            result.put("message", exception.getMessage());
            return result;
        }

        result.put("success", true);
        result.put("original", originalFilename);
        result.put("size", realFile.length() / 1024);
        result.put("suffix", suffix);
        result.put("url", dir + fileName);
        result.put("bizType", bizType);
        result.put("storagePath", realPath);
        result.put("engine", "D");
        return result;
    }

    /**
     * 保存图片
     * @param image 图片
     * @param originalFilename 原始文件名
     * @param formatName 图片格式
     * @param bizType 业务类型
     * @return
     */
    public static Map<String, Object> saveImage(BufferedImage image, String originalFilename, String formatName, String bizType) {
       return  saveBaseFile(originalFilename, bizType, file -> {
           try {
               ImageIO.write(image, formatName, file);
           } catch (IOException e) {
               throw new RuntimeException(e);
           }
       } );
    }
}
