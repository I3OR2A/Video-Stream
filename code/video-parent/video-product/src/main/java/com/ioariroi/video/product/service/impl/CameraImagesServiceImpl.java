package com.ioariroi.video.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.Query;

import com.ioariroi.video.product.dao.CameraImagesDao;
import com.ioariroi.video.product.entity.CameraImagesEntity;
import com.ioariroi.video.product.service.CameraImagesService;


@Service("cameraImagesService")
public class CameraImagesServiceImpl extends ServiceImpl<CameraImagesDao, CameraImagesEntity> implements CameraImagesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CameraImagesEntity> page = this.page(
                new Query<CameraImagesEntity>().getPage(params),
                new QueryWrapper<CameraImagesEntity>()
        );

        return new PageUtils(page);
    }

}