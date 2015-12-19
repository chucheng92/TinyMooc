package com.tinymooc.authority.util;

import java.io.File;
import java.io.IOException ;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Pattern;



public class ClassEnumUtils {
	private static List<Class<?>> findClasses(File directory, String packageName,
			String classNamePattern) throws ClassNotFoundException {
		List<Class<?>> classes = new ArrayList<Class<?>>();
		if (!directory.exists()) {
			return classes;
		}
		File[] files = directory.listFiles();
		for (File file : files) {
			String fileName = file.getName();
			if (file.isDirectory()) {
				assert !fileName.contains(".");
				classes.addAll(ClassEnumUtils.findClasses(file, packageName + "." + fileName,
						classNamePattern));
			} else if (Pattern.matches(classNamePattern, fileName) && !fileName.contains("$")) {
				Class<?> _class;
				try {
					_class = Class.forName(packageName + '.'
							+ fileName.substring(0, fileName.length() - 6));
				} catch (ExceptionInInitializerError e) {
					_class = Class.forName(
							packageName + '.' + fileName.substring(0, fileName.length() - 6),
							false, Thread.currentThread().getContextClassLoader());
				} catch (ClassNotFoundException e) {
					continue;
				}
				classes.add(_class);
			}
		}
		return classes;
	}

	public static List<Class<?>> getClasses(String packageName) throws ClassNotFoundException,
			IOException {
		return getClasses(packageName, ".*");
	}

	/**
	 * Scans all classes accessible from the context class loader which belong
	 * to the given package and subpackages.
	 * 
	 * @param packageName
	 *            The base package
	 * @return The classes
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	public static List<Class<?>> getClasses(String packageName, String classNamePattern)
			throws ClassNotFoundException, IOException {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		assert classLoader != null;
		String path = packageName.replace('.', '/');
		Enumeration<URL> resources = classLoader.getResources(path);
		List<File> dirs = new ArrayList<File>();
		while (resources.hasMoreElements()) {
			URL resource = resources.nextElement();
			String fileName = resource.getFile();
			String fileNameDecoded = URLDecoder.decode(fileName, "UTF-8");
			dirs.add(new File(fileNameDecoded));
		}
		ArrayList<Class<?>> classes = new ArrayList<Class<?>>();
		for (File directory : dirs) {
			classes.addAll(ClassEnumUtils.findClasses(directory, packageName, classNamePattern));
		}
		return classes;
	}

	/**
	 * Get methods with given Argument types from a class
	 * 
	 * @param clazz
	 *            class to search
	 * @param argClazz
	 *            argument types
	 * @return the methods
	 */
	public static final List<Method> getMethods(Class<?> clazz, Class<?>... argClazz) {
		ArrayList<Method> foundMethods = new ArrayList<Method>();
		for (Method m : clazz.getDeclaredMethods()) {
			try {
				foundMethods.add(clazz.getDeclaredMethod(m.getName(), argClazz));
			} catch (SecurityException e) {
			} catch (NoSuchMethodException e) {
			}
		}

		return foundMethods;
	}
}
