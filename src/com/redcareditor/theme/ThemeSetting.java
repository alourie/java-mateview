package com.redcareditor.theme;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.redcareditor.plist.Dict;
import com.redcareditor.plist.PlistPropertyLoader;

public class ThemeSetting {
	public String name;
	public String scope;
	public Map<String, String> settings;
	public List<ThemeSelector> matchers;
	
	private PlistPropertyLoader propertyLoader;
	
	public ThemeSetting(Dict dict){
		propertyLoader = new PlistPropertyLoader(dict, this);
		propertyLoader.loadStringProperty("name");
		propertyLoader.loadStringProperty("scope");
		
		settings = new HashMap<String, String>();
		Dict settingsDict = dict.getDictionary("settings");
		for(String key : settingsDict.value.keySet()){
			settings.put(key, (String) settingsDict.value.get(key).value);
		}
		
		compileScopeMatchers();
	}

	private void compileScopeMatchers() {
		// TODO: after dinner.
	}
}
