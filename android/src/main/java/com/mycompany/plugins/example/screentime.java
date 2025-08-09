package com.mycompany.plugins.example;

import com.getcapacitor.Logger;

public class screentime {

    public String echo(String value) {
        Logger.info("Echo", value);
        return value;
    }
}
