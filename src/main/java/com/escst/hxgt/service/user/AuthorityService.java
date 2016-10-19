package com.escst.hxgt.service.user;

import com.escst.hxgt.entity.user.AuthorityEntity;

import java.util.List;
import java.util.Set;

/**
 * 用户权限服务接口
 * Created by zcf on 2016/8/30.
 */
public interface AuthorityService {

    AuthorityEntity findOne(int authorityId);

    Set<String> findPermissions(Set<Integer> authorityIds);
}
