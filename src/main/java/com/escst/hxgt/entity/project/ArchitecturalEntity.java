package com.escst.hxgt.entity.project;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zcf on 2016/8/31.
 */
public class ArchitecturalEntity implements Serializable {
    private static final long serialVersionUID = -8555008998618506824L;
    /** id */
    private java.lang.Integer id;
    /** 创建时间 */
    private java.util.Date   createDate;
    /** 创建人 */
    private java.lang.String createBy;
    /** 创建人名称 */
    private java.lang.String createName;
    /** 更新时间 */
    private java.util.Date   updateDate;
    /** 更新人 */
    private java.lang.String updateBy;
    /** 更新人姓名 */
    private java.lang.String updateName;
    /** 项目名称 */
    private java.lang.String architecturalname;
    /** 建设单位ID */
    private java.lang.Integer developmentid;
    /** 建设单位名称 */
    private java.lang.String developmentname;
    /** 施工单位ID */
    private java.lang.Integer constructionid;
    /** 施工单位名称 */
    private java.lang.String constructionname;
    /** 监理单位ID */
    private java.lang.Integer supervisionid;
    /** 监理单位名称 */
    private java.lang.String supervisionname;
    /** 总预算 */
    private java.lang.String totalinvestment;
    /** 建筑面积 */
    private java.lang.String builtuparea;
    /** 安全员 */
    private java.lang.String safetyofficer;
    /** 材料员 */
    private java.lang.String nipplechaser;
    /** 预算员 */
    private java.lang.String budgeter;
    /** 质检员 */
    private java.lang.String qc;
    /** 施工员 */
    private java.lang.String builder;
    /** 描述 */
    private java.lang.String description;
    /** 开始日期 */
    private java.util.Date   startDate;
    /** 结束日期 */
    private java.util.Date   endDate;
    /** 地区 */
    private java.lang.String area;

    /** 省 */
    private java.lang.String belongProvince;
    /** 市 */
    private java.lang.String belongCity;
    /** 区县 */
    private java.lang.String belongArea;
    /** 所属集团公司 */
    private java.lang.String jituan;
    /** 项目经理 */
    private java.lang.String xiangmujingli;
    /** 总工 */
    private java.lang.String zonggong;
    /** 经度 */
    private java.lang.String longitude;
    /** 纬度 */
    private java.lang.String latitude;
    /** 工地范围经纬度*/
    private java.lang.String range;
    /** 状态*/
    private java.lang.Integer condition;

    /**是否在线**/
    private java.lang.Integer isonline;

    /** 临时变量 省名称**/
    private String belongProvinceName;
    /** 临时变量 市名称**/
    private String belongCityName;
    /** 临时变量 区名称**/
    private String belongAreaName;

    public String getBelongProvinceName() {
        return belongProvinceName;
    }

    public void setBelongProvinceName(String belongProvinceName) {
        this.belongProvinceName = belongProvinceName;
    }

    public String getBelongCityName() {
        return belongCityName;
    }

    public void setBelongCityName(String belongCityName) {
        this.belongCityName = belongCityName;
    }

    public String getBelongAreaName() {
        return belongAreaName;
    }

    public void setBelongAreaName(String belongAreaName) {
        this.belongAreaName = belongAreaName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateName() {
        return updateName;
    }

    public void setUpdateName(String updateName) {
        this.updateName = updateName;
    }

    public String getArchitecturalname() {
        return architecturalname;
    }

    public void setArchitecturalname(String architecturalname) {
        this.architecturalname = architecturalname;
    }

    public Integer getDevelopmentid() {
        return developmentid;
    }

    public void setDevelopmentid(Integer developmentid) {
        this.developmentid = developmentid;
    }

    public String getDevelopmentname() {
        return developmentname;
    }

    public void setDevelopmentname(String developmentname) {
        this.developmentname = developmentname;
    }

    public Integer getConstructionid() {
        return constructionid;
    }

    public void setConstructionid(Integer constructionid) {
        this.constructionid = constructionid;
    }

    public String getConstructionname() {
        return constructionname;
    }

    public void setConstructionname(String constructionname) {
        this.constructionname = constructionname;
    }

    public Integer getSupervisionid() {
        return supervisionid;
    }

    public void setSupervisionid(Integer supervisionid) {
        this.supervisionid = supervisionid;
    }

    public String getSupervisionname() {
        return supervisionname;
    }

    public void setSupervisionname(String supervisionname) {
        this.supervisionname = supervisionname;
    }

    public String getTotalinvestment() {
        return totalinvestment;
    }

    public void setTotalinvestment(String totalinvestment) {
        this.totalinvestment = totalinvestment;
    }

    public String getBuiltuparea() {
        return builtuparea;
    }

    public void setBuiltuparea(String builtuparea) {
        this.builtuparea = builtuparea;
    }

    public String getSafetyofficer() {
        return safetyofficer;
    }

    public void setSafetyofficer(String safetyofficer) {
        this.safetyofficer = safetyofficer;
    }

    public String getNipplechaser() {
        return nipplechaser;
    }

    public void setNipplechaser(String nipplechaser) {
        this.nipplechaser = nipplechaser;
    }

    public String getBudgeter() {
        return budgeter;
    }

    public void setBudgeter(String budgeter) {
        this.budgeter = budgeter;
    }

    public String getQc() {
        return qc;
    }

    public void setQc(String qc) {
        this.qc = qc;
    }

    public String getBuilder() {
        return builder;
    }

    public void setBuilder(String builder) {
        this.builder = builder;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getBelongProvince() {
        return belongProvince;
    }

    public void setBelongProvince(String belongProvince) {
        this.belongProvince = belongProvince;
    }

    public String getBelongCity() {
        return belongCity;
    }

    public void setBelongCity(String belongCity) {
        this.belongCity = belongCity;
    }

    public String getBelongArea() {
        return belongArea;
    }

    public void setBelongArea(String belongArea) {
        this.belongArea = belongArea;
    }

    public String getJituan() {
        return jituan;
    }

    public void setJituan(String jituan) {
        this.jituan = jituan;
    }

    public String getXiangmujingli() {
        return xiangmujingli;
    }

    public void setXiangmujingli(String xiangmujingli) {
        this.xiangmujingli = xiangmujingli;
    }

    public String getZonggong() {
        return zonggong;
    }

    public void setZonggong(String zonggong) {
        this.zonggong = zonggong;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    public Integer getCondition() {
        return condition;
    }

    public void setCondition(Integer condition) {
        this.condition = condition;
    }

    public Integer getIsonline() {
        return isonline;
    }

    public void setIsonline(Integer isonline) {
        this.isonline = isonline;
    }

    @Override
    public String toString() {
        return "ArchitecturalEntity{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", createBy='" + createBy + '\'' +
                ", createName='" + createName + '\'' +
                ", updateDate=" + updateDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateName='" + updateName + '\'' +
                ", architecturalname='" + architecturalname + '\'' +
                ", developmentid=" + developmentid +
                ", developmentname='" + developmentname + '\'' +
                ", constructionid=" + constructionid +
                ", constructionname='" + constructionname + '\'' +
                ", supervisionid=" + supervisionid +
                ", supervisionname='" + supervisionname + '\'' +
                ", totalinvestment='" + totalinvestment + '\'' +
                ", builtuparea='" + builtuparea + '\'' +
                ", safetyofficer='" + safetyofficer + '\'' +
                ", nipplechaser='" + nipplechaser + '\'' +
                ", budgeter='" + budgeter + '\'' +
                ", qc='" + qc + '\'' +
                ", builder='" + builder + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", area='" + area + '\'' +
                ", belongProvince='" + belongProvince + '\'' +
                ", belongCity='" + belongCity + '\'' +
                ", belongArea='" + belongArea + '\'' +
                ", jituan='" + jituan + '\'' +
                ", xiangmujingli='" + xiangmujingli + '\'' +
                ", zonggong='" + zonggong + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", range='" + range + '\'' +
                ", condition=" + condition +
                ", isonline=" + isonline +
                '}';
    }
}
