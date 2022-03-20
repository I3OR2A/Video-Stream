package com.ioariroi.video.product.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ioariroi.video.product.entity.CameraImagesEntity;
import com.ioariroi.video.product.service.CameraImagesService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.R;



/**
 * 攝像機图片
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@RestController
@RequestMapping("product/cameraimages")
public class CameraImagesController {
    @Autowired
    private CameraImagesService cameraImagesService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = cameraImagesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		CameraImagesEntity cameraImages = cameraImagesService.getById(id);

        return R.ok().put("cameraImages", cameraImages);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CameraImagesEntity cameraImages){
		cameraImagesService.save(cameraImages);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CameraImagesEntity cameraImages){
		cameraImagesService.updateById(cameraImages);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		cameraImagesService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
