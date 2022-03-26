package com.ioariroi.video.thirdparty.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * <p>Title: ThreadPoolConfigProperties</p>
 * Description：
 */
@ConfigurationProperties(prefix = "video.thread")
//@Component
@Data
public class ThreadPoolConfigProperties {

    private Integer coreSize;

    private Integer maxSize;

    private Integer keepAliveTime;
}