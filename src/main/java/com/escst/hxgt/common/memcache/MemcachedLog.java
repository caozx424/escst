package com.escst.hxgt.common.memcache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zcf on 2015/11/21.
 */
public class MemcachedLog {
    /**
     *
     * @ClassName: MemcachedLog
     * @Description: memcached日志记录
     * @author 张超锋
     * @date 2015-11-21 下午5:01:37
     *
     */
    private static final Logger logger = LoggerFactory.getLogger(MemcachedLog.class);
    private final static String MEMCACHED_LOG = System.getProperty("user.dir");
    private final static String LINUX_MEMCACHED_LOG = "/usr/local/logs/memcached.log";
    private static FileWriter fileWriter;
    private static BufferedWriter logWrite;
    // 获取PID，可以找到对应的JVM进程
    private final static RuntimeMXBean runtime = ManagementFactory.getRuntimeMXBean();
    private final static String PID = runtime.getName();

    /**
     * 初始化写入流
     */
    static {
        try {
            String osName = System.getProperty("os.name");
            if (osName.indexOf("Windows") == -1) {
                fileWriter = new FileWriter(MEMCACHED_LOG, true);
            } else {
                fileWriter = new FileWriter(LINUX_MEMCACHED_LOG, true);
            }
            logWrite = new BufferedWriter(fileWriter);
        } catch (IOException e) {
            logger.error("memcached 日志初始化失败", e);
            closeLogStream();
        }
    }
    /**
     * 写入日志信息
     * @param content 日志内容
     */
    public static void writeLog(String content) {
        try {
            logWrite.write("[" + PID + "] " + "- [" + new SimpleDateFormat("yyyy年-MM月-dd日 hh时:mm分:ss秒").format(new Date().getTime()) + "]\r\n"
                    + content);
            logWrite.newLine();
            logWrite.flush();
        } catch (IOException e) {
            logger.error("memcached 写入日志信息失败", e);
        }
    }

    /**
     * 关闭流
     */
    private static void closeLogStream() {
        try {
            fileWriter.close();
            logWrite.close();
        } catch (IOException e) {
            logger.error("memcached 日志对象关闭失败", e);
        }
    }
}
