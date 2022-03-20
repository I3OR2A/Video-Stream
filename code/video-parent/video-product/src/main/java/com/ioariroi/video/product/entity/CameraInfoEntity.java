package com.ioariroi.video.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 攝像機資訊
 * 
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@Data
@TableName("pms_camera_info")
public class CameraInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 攝像機id
	 */
	@TableId
	private Long id;
	/**
	 * 攝像機名称
	 */
	private String name;
	/**
	 * 攝像機ip
	 */
	private String hostname;
	/**
	 * 攝像機阜口
	 */
	private Long port;
	/**
	 * 接入帳號
	 */
	private String username;
	/**
	 * 接入密碼
	 */
	private String password;
	/**
	 * 攝像機描述
	 */
	private String description;
	/**
	 * 所属分类id
	 */
	private Long catId;
	/**
	 * 上架状态[0 - 下架，1 - 上架]
	 */
	private Integer publishStatus;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;

}
