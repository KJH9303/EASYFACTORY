package com.feb.main;

import java.net.URL;
import java.net.URLClassLoader;

public class DatePickerMain {
	public static void main(String[] args) throws Exception {
		URL url = new URL("file:\\C:\\Library\\JDatePicker.jar"); // JDatePicker 라이브러리의 경로 입력
		URLClassLoader urlClassLoader = (URLClassLoader) ClassLoader.getSystemClassLoader();
		Class<?> urlClass = URLClassLoader.class;
		java.lang.reflect.Method method = urlClass.getDeclaredMethod("addURL", new Class[]{URL.class});
		method.setAccessible(true);
		method.invoke(urlClassLoader, new Object[]{url});
	}
}

