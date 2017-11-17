package com.fomagic.module.sys.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.fomagic.module.sys.entity.SysUser;
import com.fomagic.module.sys.service.SysUserService;


public class MyRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService userService;
	
	
	/**
	 * 对用户进行授权和授予权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//authorizationInfo.setRoles(userService.getRoles(username));
		//authorizationInfo.setStringPermissions(userService.getPermissions(username));
				
		return authorizationInfo;
	}

	
	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		SysUser user = userService.getByUserName(username);
		if (user==null) {
			throw new UnknownAccountException("No account found for user [" + username + "]");
		}
		String realmName = getName();
		System.out.println("realmName = "+realmName );
		ByteSource credentialsSalt = ByteSource.Util.bytes(username);
		AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), credentialsSalt, realmName);
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
