package kh.project.stayfit.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundLog {
	
	@Pointcut("execution(public * kh.project.stayfit..*Controller.*(..))") // ..(점 두개) : 없을수도, 여러개일수도  // * : 한 개 이상!
	public void commonControllerPointcut() {}
	@Pointcut("execution(public * kh.project.stayfit..*ServiceImpl.*(..))")
	public void commonServicePointcut() {}
	@Pointcut("execution(public * kh.project.stayfit..*Dao.*(..))")
	public void commonDaoPointcut(){}
	
	@Around("commonControllerPointcut()")
	public Object aroundCtrlLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t[Ctr시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\tCtr Args[" + i + "]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();  // 타겟메소드 호출하여 수행하고 그 결과(return value)를 ro에 담음.
		sw.stop();

		if (ro != null) {
			System.out.println("\tCtr Ret: " + ro.toString());
		}
		System.out.println("\t[Ctr끝: " + sw.getTotalTimeMillis() + "ms]");
		System.out.println();
		return ro;
	}
	
	@Around("commonServicePointcut()")
	public Object aroundSrvcLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t\t[Srv시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\t\tSrv Args[" + i + "]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();  // 타겟메소드 호출하여 수행하고 그 결과(return value)를 ro에 담음.
		sw.stop();
		
		if (ro != null) {
			System.out.println("\t\tSrv Ret: " + ro.toString());
		}
		System.out.println("\t\t[Srv끝: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
	
	@Around("commonDaoPointcut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("\t\t\t[Dao시작 : " + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for (int i = 0; i < args.length; i++) {
			System.out.print("\t\t\tDao Args[" + i + "]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		Object ro = pjp.proceed();  // 타겟메소드 호출하여 수행하고 그 결과(return value)를 ro에 담음.
		sw.stop();
		
		if (ro != null) {
			System.out.println("\t\t\tDao Return: " + ro.toString());
		}
		System.out.println("\t\t\t[Dao끝: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}

	
}
