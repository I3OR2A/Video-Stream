package com.ioariroi.video.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.Query;

import com.ioariroi.video.product.dao.CameraInfoDao;
import com.ioariroi.video.product.entity.CameraInfoEntity;
import com.ioariroi.video.product.service.CameraInfoService;


@Service("cameraInfoService")
public class CameraInfoServiceImpl extends ServiceImpl<CameraInfoDao, CameraInfoEntity> implements CameraInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CameraInfoEntity> page = this.page(
                new Query<CameraInfoEntity>().getPage(params),
                new QueryWrapper<CameraInfoEntity>()
        );

        return new PageUtils(page);
    }

}