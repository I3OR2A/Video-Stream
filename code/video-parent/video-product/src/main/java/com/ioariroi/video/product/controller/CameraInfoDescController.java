package com.ioariroi.video.product.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ioariroi.video.product.entity.CameraInfoDescEntity;
import com.ioariroi.video.product.service.CameraInfoDescService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.R;



/**
 * 攝像機資訊介绍
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@RestController
@RequestMapping("product/camerainfodesc")
public class CameraInfoDescController {
    @Autowired
    private CameraInfoDescService cameraInfoDescService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = cameraInfoDescService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		CameraInfoDescEntity cameraInfoDesc = cameraInfoDescService.getById(id);

        return R.ok().put("cameraInfoDesc", cameraInfoDesc);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CameraInfoDescEntity cameraInfoDesc){
		cameraInfoDescService.save(cameraInfoDesc);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CameraInfoDescEntity cameraInfoDesc){
		cameraInfoDescService.updateById(cameraInfoDesc);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		cameraInfoDescService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
