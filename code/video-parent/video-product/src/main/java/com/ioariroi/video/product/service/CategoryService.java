package com.ioariroi.video.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.video.product.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 攝像機三级分类
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<CategoryEntity> listWithTree();

    void removeMenuByIds(List<Long> asList);
}

