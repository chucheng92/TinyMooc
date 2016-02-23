package com.tinymooc.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

/**
 * Created by 哓哓 on 2016/1/3 0014.
 * 处理CSV文件读取
 */
public class CSVUtil {

    public static void main(String[] args) {

    }
    public static String format(String str) {
        String regex = "[\\s\"]+";
        String res = str.replaceAll(regex, "");

        return res;
    }

    public static String core(File file, String srcTitle) {
        String fileId = null;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "GBK"));
            br.readLine();
            String line = null;
            while ((line = br.readLine()) != null) {
                String[] res = line.split(",");
                String targetTitle = res[1];
                fileId = res[0];
                if (targetTitle.equals(srcTitle)) {
                    break;
                } else {
                    fileId = null;
                }
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (fileId !=  null)
            return format(fileId);
        else
            return  null;
    }
}
