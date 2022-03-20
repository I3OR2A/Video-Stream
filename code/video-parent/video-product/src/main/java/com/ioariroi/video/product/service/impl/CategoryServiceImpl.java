package com.ioariroi.video.product.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.Query;

import com.ioariroi.video.product.dao.CategoryDao;
import com.ioariroi.video.product.entity.CategoryEntity;
import com.ioariroi.video.product.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

    @Override // service层
    public List<CategoryEntity> listWithTree() {
        // 怎么拿categoryDao？
        /*
        * 继承了ServiceImpl<CategoryDao, CategoryEntity>
        有个属性baseMapper，自动注入
        * */

        // 1 查出所有分类
        List<CategoryEntity> categoryEntities = baseMapper.selectList(null);
        // 2 组装成父子的树型结构
        // 2.1 找到所有一级分类
        List<CategoryEntity> level1Menus = categoryEntities.stream().filter(
                // 找到一级
                categoryEntity -> categoryEntity.getParentCid() == 0
        ).map(menu->{
            // 把当前的child属性改了之后重新返回
            menu.setChildren(getChildren(menu,categoryEntities));
            return menu;
        }).sorted((menu1,menu2)->
                menu1.getSort()-menu2.getSort()).collect(Collectors.toList());

        return level1Menus;
//        return categoryEntities;
    }

    /**
     * 获取某一个菜单的子菜单
     * 在all里找root的子菜单
     * @param
     * */
    private List<CategoryEntity> getChildren(CategoryEntity root,List<CategoryEntity> all){
        List<CategoryEntity> children = all.stream().filter(categoryEntity -> {
            // 找到当前id的子菜单
            return categoryEntity.getParentCid() == root.getId();
        }).map(categoryEntity -> {
            // 1 找到子菜单，递归找法
            categoryEntity.setChildren(getChildren(categoryEntity,all));
            return categoryEntity;
        }).sorted((menu1,menu2)->{
            // 2 菜单排序
            return menu1.getSort()-menu2.getSort();
            // menu1.getSort()==null?0;menu1.getSort()
        }).collect(Collectors.toList());
        return children;
    }

    @Override
    public void removeMenuByIds(List<Long> asList) {
        //TODO 1 检查当前的菜单是否被别的地方所引用
        // 2
        baseMapper.deleteBatchIds(asList);
    }
}