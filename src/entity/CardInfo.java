package entity;

import java.util.Date;

public class CardInfo {
    private String cardId;  //卡号
    private String curType; //币种
    private Boolean savingType; //0活期，1定期
    private String money;   //钱
    private Integer prestore;   //预存余额
    private String password;    //密码
    private Date openDate;  //开户时间
    private Boolean isReportLoss;   //是否挂失，0不是，1是
    private Integer customerId; //绑定账号

    public CardInfo(String cardId) {
        this.cardId = cardId;
    }

    public CardInfo() {

    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getCurType() {
        return curType;
    }

    public void setCurType(String curType) {
        this.curType = curType;
    }

    public Boolean getSavingType() {
        return savingType;
    }

    public void setSavingType(Boolean savingType) {
        this.savingType = savingType;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Integer getPrestore() {
        return prestore;
    }

    public void setPrestore(Integer prestore) {
        this.prestore = prestore;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    public Boolean getReportLoss() {
        return isReportLoss;
    }

    public void setReportLoss(Boolean reportLoss) {
        isReportLoss = reportLoss;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    @Override
    public String toString() {
        return "CardInfo{" +
                "cardId='" + cardId + '\'' +
                ", curType='" + curType + '\'' +
                ", savingType=" + savingType +
                ", money=" + money +
                ", prestore=" + prestore +
                ", password='" + password + '\'' +
                ", openDate=" + openDate +
                ", isReportLoss=" + isReportLoss +
                ", customerId=" + customerId +
                '}';
    }
}
