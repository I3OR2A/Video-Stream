package com.ioariroi.video.product.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ioariroi.video.product.entity.CategoryEntity;
import com.ioariroi.video.product.service.CategoryService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.R;



/**
 * 攝像機三级分类
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@RestController
@RequestMapping("product/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查出所有分类 以及子分类，以树形结构组装起来
     */
    @RequestMapping("/list/tree")
    public R list(){
        List<CategoryEntity> entities = categoryService.listWithTree();
        // 筛选出所有一级分类
//        List<CategoryEntity> level1Menus = entities.stream().
//                filter((categoryEntity) -> categoryEntity.getParentCid() == 0)
//                .map((menu) -> {
//                    menu.setChildren(getChildrens(menu, entities));
//                    return menu;
//                }).sorted((menu1, menu2) -> {
//                    return (menu1.getSort() == null? 0 : menu1.getSort()) - (menu2.getSort() == null? 0 : menu2.getSort());
//                })
//                .collect(Collectors.toList());
        return R.ok().put("data", entities);
    }
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = categoryService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		CategoryEntity category = categoryService.getById(id);

        return R.ok().put("data", category);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CategoryEntity category){
		categoryService.save(category);

        return R.ok();
    }

    /**
     * 批量修改层级
     */
    @RequestMapping("/update/sort")
    public R updateSort(@RequestBody CategoryEntity[] category){
        categoryService.updateBatchById(Arrays.asList(category));
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CategoryEntity category){
		categoryService.updateById(category);

        return R.ok();
    }

    /**
     * 删除
     * 必须发送POST请求
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] catIds){
        categoryService.removeByIds(Arrays.asList(catIds));
        // 检查当前节点是否被别的地方引用
        categoryService.removeMenuByIds(Arrays.asList(catIds));
        return R.ok();
    }
}
