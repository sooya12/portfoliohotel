package pkg.res;

import java.sql.Timestamp;

import util.Parameter;

public class Pkg_resVO extends Parameter {

	private int no; //pk
	private int pkg_pk; // 패키지 pk
	private String pkg_name; // 패키지명
	private int member_pk; // 회원가입할때 받은 no
	private Timestamp purchase_date; // 예약일
	private String use_date; // 사용일
	private String guest_name1; // 고객명1
	private String guest_name2; // 고객명2
	private String guest_tel1; // 고객 연락처1
	private String guest_tel2; // 고객 연락처2
	private String guest_tel3; // 고객 연락처3
	private String email; // 고객 이메일
	private int pkg_price; // 패키지 가격
	private int pkg_count; // 패키지 수량
	private int total_price; // 총 가격
	
	
	public Pkg_resVO(int pageRows) {
		super.setPageRows(pageRows);
	}
	public Pkg_resVO() {
		super.setPageRows(10);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPkg_pk() {
		return pkg_pk;
	}
	public void setPkg_pk(int pkg_pk) {
		this.pkg_pk = pkg_pk;
	}
	public String getPkg_name() {
		return pkg_name;
	}
	public void setPkg_name(String pkg_name) {
		this.pkg_name = pkg_name;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public Timestamp getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Timestamp purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getUse_date() {
		return use_date;
	}
	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPkg_price() {
		return pkg_price;
	}
	public void setPkg_price(int pkg_price) {
		this.pkg_price = pkg_price;
	}
	public int getPkg_count() {
		return pkg_count;
	}
	public void setPkg_count(int pkg_count) {
		this.pkg_count = pkg_count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getGuest_name1() {
		return guest_name1;
	}
	public void setGuest_name1(String guest_name1) {
		this.guest_name1 = guest_name1;
	}
	public String getGuest_name2() {
		return guest_name2;
	}
	public void setGuest_name2(String guest_name2) {
		this.guest_name2 = guest_name2;
	}
	public String getGuest_tel1() {
		return guest_tel1;
	}
	public void setGuest_tel1(String guest_tel1) {
		this.guest_tel1 = guest_tel1;
	}
	public String getGuest_tel2() {
		return guest_tel2;
	}
	public void setGuest_tel2(String guest_tel2) {
		this.guest_tel2 = guest_tel2;
	}
	public String getGuest_tel3() {
		return guest_tel3;
	}
	public void setGuest_tel3(String guest_tel3) {
		this.guest_tel3 = guest_tel3;
	}
	
}