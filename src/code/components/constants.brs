


function getDevSentryDictionary() 

    myDict = {
        Dsn : "https://d2f35d8007a9495db884f2528dcf2639@o335238.ingest.io.4504282466942976",
        SecurityEndpoint : "https://o335238.ingest.io/api/4504282466942976/envelope/",
        MiniDumpEndpoint : "https://o335238.ingest.io/api/4504282466942976/minidump/?sentry_key=99xxxxxxxxxxxx",
        Environment : "dev",
        Release : "Roku Sentry@1.1.2023008",
        Debug : true,
        XSentryToken : "9de898de757011eda623c2886b866b866100",
        ClientSecret : "88xxxxxxxxxxxx",
        ClientId : "77xxxxxxxxxxxx",
        TraceSampleRate : 1.0
    }

    return myDict
    
    end function