package com.ioariroi.video.product.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.Query;

import com.ioariroi.video.product.dao.CameraInfoDescDao;
import com.ioariroi.video.product.entity.CameraInfoDescEntity;
import com.ioariroi.video.product.service.CameraInfoDescService;


@Service("cameraInfoDescService")
public class CameraInfoDescServiceImpl extends ServiceImpl<CameraInfoDescDao, CameraInfoDescEntity> implements CameraInfoDescService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CameraInfoDescEntity> page = this.page(
                new Query<CameraInfoDescEntity>().getPage(params),
                new QueryWrapper<CameraInfoDescEntity>()
        );

        return new PageUtils(page);
    }

}