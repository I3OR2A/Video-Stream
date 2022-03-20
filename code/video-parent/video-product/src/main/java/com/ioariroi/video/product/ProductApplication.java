package com.ioariroi.video.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@MapperScan("com.ioariroi.video.product.dao")
@EnableFeignClients(basePackages="com.ioariroi.video.product.feign")// 扫描远程调用接口
@SpringBootApplication
public class ProductApplication {


    public static void main(String[] args) {

        SpringApplication.run(ProductApplication.class, args);
    }
}
