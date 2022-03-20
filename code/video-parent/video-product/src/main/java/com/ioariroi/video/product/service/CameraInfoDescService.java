package com.ioariroi.video.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.video.product.entity.CameraInfoDescEntity;

import java.util.Map;

/**
 * 攝像機資訊介绍
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
public interface CameraInfoDescService extends IService<CameraInfoDescEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

