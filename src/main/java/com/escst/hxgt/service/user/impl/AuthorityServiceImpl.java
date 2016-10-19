package com.escst.hxgt.service.user.impl;

import com.escst.hxgt.entity.user.AuthorityEntity;
import com.escst.hxgt.service.user.AuthorityService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.inject.Inject;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by zcf on 2016/8/30.
 */
@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Override
    public AuthorityEntity findOne(int authorityId) {
    	return null;
    }
    @Override
    public Set<String> findPermissions(Set<Integer> authorityIds) {
        Set<String> permissions = new HashSet<String>();
        for(int authorityId : authorityIds) {
            AuthorityEntity resource = findOne(authorityId);
            if(resource != null && !StringUtils.isEmpty(resource.getPermission())) {
                permissions.add(resource.getPermission());
            }
        }
        return permissions;
    }
}
