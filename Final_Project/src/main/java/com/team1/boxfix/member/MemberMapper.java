package com.team1.boxfix.member;

public interface MemberMapper {

	public int join(Member m);

	public Member getMemberById(Member m);

	public int bye(Member m);

	public int update(Member m);

	public Member findID(Member m);

	public Member findPW(Member m);

	public Member changePW(Member m);

}
