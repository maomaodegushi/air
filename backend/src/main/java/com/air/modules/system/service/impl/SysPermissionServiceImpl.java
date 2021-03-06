package com.air.modules.system.service.impl;

import com.air.common.constant.CommonConstant;
import com.air.common.exception.ServiceException;
import com.air.common.util.RedisUtil;
import com.air.common.util.oConvertUtils;
import com.air.modules.system.entity.SysPermission;
import com.air.modules.system.mapper.SysPermissionMapper;
import com.air.modules.system.model.TreeModel;
import com.air.modules.system.service.ISysPermissionService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 菜单权限表 服务实现类
 *
 * @author lee
 */
@Service
@CacheConfig(cacheNames = "permission")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

	@Resource
	private SysPermissionMapper sysPermissionMapper;

	@Override
	public List<TreeModel> queryListByParentId(String parentId) {
		return sysPermissionMapper.queryListByParentId(parentId);
	}


	/**
	  * 真实删除
	 */
	@Override
	public void deletePermission(String id) throws ServiceException {
		SysPermission sysPermission = this.getById(id);
		if(sysPermission==null) {
			throw new ServiceException("未找到菜单信息");
		}
		String pid = sysPermission.getParentId();
		int count = this.count(new QueryWrapper<SysPermission>().lambda().eq(SysPermission::getParentId, pid));
		if(count==1) {
			//若父节点无其他子节点，则该父节点是叶子节点
			SysPermission tmpPer=new SysPermission();
			tmpPer.setIsLeaf(1);
			this.update(tmpPer,new UpdateWrapper<SysPermission>().eq("id",pid));
		}
		sysPermissionMapper.deleteById(id);
	}

	/**
	  * 逻辑删除
	 */
	@Override
	public void deletePermissionLogical(String id) throws ServiceException {
		SysPermission sysPermission = this.getById(id);
		if(sysPermission==null) {
			throw new ServiceException("未找到菜单信息");
		}
		String pid = sysPermission.getParentId();
		int count = this.count(new QueryWrapper<SysPermission>().lambda().eq(SysPermission::getParentId, pid));
		if(count==1) {
			//若父节点无其他子节点，则该父节点是叶子节点
			SysPermission tmpPer=new SysPermission();
			tmpPer.setIsLeaf(1);
			this.update(tmpPer,new UpdateWrapper<SysPermission>().eq("id",pid));
		}
		sysPermission.setIsDeleted("1");
		this.updateById(sysPermission);
	}

	@Override
	public void addPermission(SysPermission sysPermission, String userId) throws ServiceException {
		//----------------------------------------------------------------------
		//判断是否是一级菜单，是的话清空父菜单
		if(CommonConstant.MENU_TYPE_0.equals(sysPermission.getMenuType())) {
			sysPermission.setParentId(null);
		}
		//----------------------------------------------------------------------
		String pid = sysPermission.getParentId();
		if(oConvertUtils.isNotEmpty(pid)) {
			//设置父节点不为叶子节点
			SysPermission tmpPer=new SysPermission();
			tmpPer.setIsLeaf(0);
			this.update(tmpPer,new UpdateWrapper<SysPermission>().eq("id",pid));
		}
		sysPermission.setCreateTime(new Date());
		sysPermission.setCreateBy(userId);
		sysPermission.setIsDeleted("0");
		sysPermission.setIsLeaf(1);
		this.save(sysPermission);
	}

	@Override
	public void editPermission(SysPermission sysPermission, String userId) throws ServiceException {
		SysPermission p = this.getById(sysPermission.getId());

		//TODO 该节点判断是否还有子节点
		if( p== null) {
			throw new ServiceException("未找到菜单信息");
		} else {

			sysPermission.setUpdateBy(userId);
			sysPermission.setUpdateTime(new Date());
			//----------------------------------------------------------------------
			//判断是否是一级菜单，是的话清空父菜单
			if(CommonConstant.MENU_TYPE_0.equals(sysPermission.getMenuType())) {
				sysPermission.setParentId("");
			}
			//----------------------------------------------------------------------
			this.updateById(sysPermission);
			String pid = sysPermission.getParentId();
			if(oConvertUtils.isNotEmpty(pid) && !pid.equals(p.getParentId())) {
				//设置父节点不为叶子节点
				SysPermission tmpPer=new SysPermission();
				tmpPer.setIsLeaf(0);
				this.update(tmpPer,new UpdateWrapper<SysPermission>().eq("id",pid));
			}
		}

	}

	@Override
	@Cacheable(key = "#username")
	public List<SysPermission> queryByUser(String username) {
		List<SysPermission> list=this.sysPermissionMapper.queryByUser(username);
		return list;
	}

}
