package org.ssssssss.magicboot.utils;




import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

/**
 * 生成文字头像图片
 */
public class ImageGenerator {

    /**
     * 根据文本生成图片
     * @param text 文字
     * @param width 图片宽度
     * @param height 图片高度
     * @param textRgbColor 文字颜色
     * @param backgroundRgbColor 背景色
     * @return
     */
    public static BufferedImage createImageByText(String text, int width, int height, Color textRgbColor, Color backgroundRgbColor) {

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = image.createGraphics();

        g2d.setComposite(AlphaComposite.Src);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // 绘制圆形背景
        g2d.setColor(backgroundRgbColor);
        Ellipse2D.Double circle = new Ellipse2D.Double(0, 0, width, height);
        g2d.fill(circle);
        g2d.setComposite(AlphaComposite.SrcAtop);

        // 设置字体
        Font font = new Font("微软雅黑", Font.PLAIN, 40);
        g2d.setFont(font);

        // 获取字体的绘制区域
        FontMetrics fm = g2d.getFontMetrics();
        int textWidth = fm.stringWidth(text);
        int textHeight = fm.getHeight();

        // 计算文字的位置
        int x = (width - textWidth) / 2;
        int y = (height - textHeight) / 2 + fm.getAscent();

        // 设置文字颜色
        g2d.setColor(textRgbColor);

        // 绘制文字
        g2d.drawString(text, x, y);

        g2d.dispose();
        return image;
    }

    /**
     * 输出图片
     * @param image
     * @param outputStream
     */
    public static void outputImage(BufferedImage image, OutputStream outputStream) {
        try {
            ImageIO.write(image, "png", outputStream);
        } catch (IOException ignored) {
        }
    }

    public static Color randomColor() {
        String[] beautifulColors =
                new String[]{"232,221,203", "205,179,128", "3,101,100", "3,54,73", "3,22,52",
                        "237,222,139", "251,178,23", "96,143,159", "1,77,103", "254,67,101", "252,157,154",
                        "249,205,173", "200,200,169", "131,175,155", "229,187,129", "161,23,21", "34,8,7",
                        "118,77,57", "17,63,61", "60,79,57", "95,92,51", "179,214,110", "248,147,29",
                        "227,160,93", "178,190,126", "114,111,238", "56,13,49", "89,61,67", "250,218,141",
                        "3,38,58", "179,168,150", "222,125,44", "20,68,106", "130,57,53", "137,190,178",
                        "201,186,131", "222,211,140", "222,156,83", "23,44,60", "39,72,98", "153,80,84",
                        "217,104,49", "230,179,61", "174,221,129", "107,194,53", "6,128,67", "38,157,128",
                        "178,200,187", "69,137,148", "117,121,71", "114,83,52", "87,105,60", "82,75,46",
                        "171,92,37", "100,107,48", "98,65,24", "54,37,17", "137,157,192", "250,227,113",
                        "29,131,8", "220,87,18", "29,191,151", "35,235,185", "213,26,33", "160,191,124",
                        "101,147,74", "64,116,52", "255,150,128", "255,94,72", "38,188,213", "167,220,224",
                        "1,165,175", "179,214,110", "248,147,29", "230,155,3", "209,73,78", "62,188,202",
                        "224,160,158", "161,47,47", "0,90,171", "107,194,53", "174,221,129", "6,128,67",
                        "38,157,128", "201,138,131", "220,162,151", "137,157,192", "175,215,237", "92,167,186",
                        "255,66,93", "147,224,255", "247,68,97", "185,227,217"};
        int len = beautifulColors.length;
        Random random = new Random();
        String[] color = beautifulColors[random.nextInt(len)].split(",");
        return new Color(Integer.parseInt(color[0]), Integer.parseInt(color[1]), Integer.parseInt(color[2]));
    }
}