package com.fomagic.module.sys.shiro;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fomagic.module.sys.entity.SysMenu;
import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysMenuService;
import com.fomagic.module.sys.service.SysUserService;


public class UserRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysMenuService sysMenuService;


	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 对用户进行授权和授予权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		

		logger.info("doGetAuthorizationInfo  ================================= ");
		
		
		SysUser user = (SysUser) principals.getPrimaryPrincipal();
		Long userId =  user.getUserId();
		
		List<String> permsList = null;
		
		if (userId == 1) {
			List<SysMenu> menuList = sysMenuService.listMenu(new HashMap<String, Object>());
			permsList = new ArrayList<>(menuList.size());
			for (SysMenu sysMenu : menuList) {
				permsList.add(sysMenu.getPerms());
			}
		} else {
			permsList = sysUserService.listAllperms(userId);
		}
		
		
		Set<String> permsSet = new HashSet<String>();
		for (String perms : permsList) {
			if (StringUtils.isBlank(perms)) {
				continue;
			}
			permsSet.addAll(Arrays.asList(perms.trim().split(",")));
		}
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setStringPermissions(permsSet);
				
		return authorizationInfo;
	}
	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		

		logger.info("doGetAuthenticationInfo  ================================= ");
		
		UsernamePasswordToken token = (UsernamePasswordToken)authcToken;
		String username = token.getUsername();

		SysUser user = sysUserService.getByUserName(username);
		if (user==null) {
			throw new UnknownAccountException("账号不正确： [" + username + "]");
		}
		String realmname = getName();
		ByteSource credentialsSalt = ByteSource.Util.bytes(username);
		AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), credentialsSalt, realmname);
		return authenticationInfo;	
	}
	
	/**
	 * 测试
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println();
		int hashInterations = 1024;
		Object salt = "magic";
		Object credentials = "123456";
		String hashAlgorithmName = "MD5";

		long begin = System.currentTimeMillis();
		Object simpleHash = new SimpleHash(hashAlgorithmName, credentials, salt,hashInterations);
		long end = System.currentTimeMillis();
		System.out.println("加密花费时间： " + (end-begin));
		System.out.println("加密后的值： "+simpleHash);
		
		System.out.println(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
		
	}

}
