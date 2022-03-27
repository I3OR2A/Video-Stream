package com.zj.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Getter;
import lombok.Setter;

/**
 * camera相机
 * @author ZJ
 *
 */
@Getter
@Setter
@TableName("camera")
@Entity
@Table(name="camera")	//jpa自动创建表
public class Camera implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5575352151805386129L;

	@Id
	@TableId(type = IdType.AUTO)
    private Integer id;
	
	@Column
	private String url;
	@Column
	private String remark;
	@Column
	private Integer flv = 0;
	@Column
	private Integer hls = 0;
	@Column
	private Integer ffmpeg = 1;
	@Column
	private Integer autoClose;
	@Column
	private Integer type = 0;
	@Column
	private String mediaKey;
}
