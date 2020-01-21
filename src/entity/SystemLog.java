package entity;

import java.util.Date;

public class SystemLog {
    private Integer logId;  //日志编号
    private String cardId;  //卡号
    private String function; //操作方法
    private String params; //传入参数
    private Date optime;    //交易时间

    public SystemLog() {
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public Date getOptime() {
        return optime;
    }

    public void setOptime(Date optime) {
        this.optime = optime;
    }

    @Override
    public String toString() {
        return "SystemLog{" +
                "logId=" + logId +
                ", cardId='" + cardId + '\'' +
                ", function='" + function + '\'' +
                ", params='" + params + '\'' +
                ", optime=" + optime +
                '}';
    }
}
