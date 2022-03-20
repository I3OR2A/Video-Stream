package com.ioariroi.video.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.video.product.entity.CameraInfoEntity;

import java.util.Map;

/**
 * 攝像機資訊
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
public interface CameraInfoService extends IService<CameraInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

