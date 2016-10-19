package com.escst.hxgt.entity.type;

/**
 * Created by caozx on 2016/9/9.
 */
public class TypeGroupEntity {
    /**用户职能**/
    public static final String ZHENG_FU = "zhengfu";
    /**处罚方式**/
    public static final String PUNISH = "punish";
    /**工种*/
    public static final String GONGZHONG="gongzhong";
    /**图标类型**/
    public static final String ICON_TYPE = "icontype";

    private int id;
    private String code;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    private String name;

}
