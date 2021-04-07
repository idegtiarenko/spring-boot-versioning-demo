package com.github.idegtiarenko.springbootversioningdemo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Slf4j
@Component
public class VersionProvider {

    @Autowired
    private BuildProperties buildProperties;

    public String getVersionFromBuildProperties() {
        return buildProperties.getVersion();
    }

    public String getVersionFromPackage() {
        return VersionProvider.class.getPackage().getImplementationVersion();
    }

    @PostConstruct
    public void logAppVersion() {
        log.info("Application version {}/{}", getVersionFromBuildProperties(), getVersionFromPackage());
    }
}
