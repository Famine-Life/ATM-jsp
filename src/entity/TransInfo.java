package entity;

import java.sql.Date;

public class TransInfo {
    private String cardId;  //银行卡号
    private Integer transType;  //交易类型  存0，取1，转账2
    private Integer transMoney;  //交易金额    转账金额为整数，用integer
    private Date transDate; //交易时间
    private String remark;  //备注 (转入的账号)

    public TransInfo() {
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public Integer getTransType() {
        return transType;
    }

    public void setTransType(Integer transType) {
        this.transType = transType;
    }

    public Integer getTransMoney() {
        return transMoney;
    }

    public void setTransMoney(Integer transMoney) {
        this.transMoney = transMoney;
    }

    public Date getTransDate() {
        return transDate;
    }

    public void setTransDate(Date transDate) {
        this.transDate = transDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "TransInfo{" +
                "cardId='" + cardId + '\'' +
                ", transType=" + transType +
                ", transMoney=" + transMoney +
                ", transDate=" + transDate +
                ", remark='" + remark + '\'' +
                '}';
    }
}
