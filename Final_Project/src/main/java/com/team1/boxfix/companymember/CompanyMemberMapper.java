package com.team1.boxfix.companymember;

public interface CompanyMemberMapper {

	public int companyJoin(CompanyMember c);

	public CompanyMember getCompanyMemberById(CompanyMember c);

	public int companyBye(CompanyMember c);

	public int companyUpdate(CompanyMember c);

}
