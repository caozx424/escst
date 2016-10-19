package com.escst.hxgt.auth;

import com.escst.hxgt.common.memcache.MemcachedUtils;
import com.escst.hxgt.entity.user.UserEntity;
import com.escst.hxgt.service.user.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import javax.inject.Inject;
import java.util.Date;
import java.util.Set;

/**
 * Created by tao on 2014/12/2.
 */
public class UserRealm extends AuthorizingRealm {
	
    @Inject
    private UserService userService;

    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        Set<String> roles = userService.findRoles(username);

        authorizationInfo.setRoles(roles);
        authorizationInfo.setStringPermissions(userService.findPermissions(username));
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();

        UserEntity user = userService.findByUsername(username);

        if (user == null) {
            throw new UnknownAccountException();//没找到帐号
        }

        if (user.getLocked()!=null && user.getLocked() == 1) {
            throw new LockedAccountException(); //帐号锁定
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //用户名
                user.getPassword(), //密码
                ByteSource.Util.bytes(user.getCredentialsSalt()),//salt=username+salt
                getName()  //auth name
        );

        //把用户信息加入session
        this.setSession("user", user);
        //用户信息放入缓存
//        MemcachedUtils.set("user",user,new Date(1000*60*30));

        //用户角色
//        RoleEntity roleEntity = roleService.findRoleByUserId(user.getId());
//        this.setSession("roleEntity", roleEntity);
        return authenticationInfo;
    }

    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     */
    private void setSession(Object key, Object value){
        Subject currentUser = SecurityUtils.getSubject();
        if(null != currentUser){
            Session session = currentUser.getSession();
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if(null != session){
                session.setAttribute(key, value);
            }
        }
    }
}
