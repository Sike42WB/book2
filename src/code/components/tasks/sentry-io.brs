function init() 

   m.SENTRY_SDK_VERSION = "2.0.4"
   m.top.id = "SentryTask"
   m.top.functionName = "errorInit"

end function

sub errorInit()


err = getDevSentryDictionary()
initUrl = err.Dsn
http = CreateObject("roUrlTransfer")
port = CreateObject("roMessagePort")

http.AddHeader("Content-Type", "application/json; charset=utf-8")
http.AddHeader("Access-Control-Allow-Origin", "https://sentry.io")
http.AddHeader("Connection", "Keep-Alive")
http.AddHeader("ClientID", "Roku")
http.AddHeader("AuthorizationURL", "https://sentry.io/api/0/")


http.AddHeader("ClientSecret", err.ClientSecret)
http.AddHeader("x-Sentry-Token", err.XSentryToken)
http.AddHeader("Trace", "true")


http.EnableEncodings(true)
http.initClientCertificates()
http.EnablePeerVerification(true)
http.RetainBodyOnError(true)

http.SetCertificatesFile("common:/certs/ca-bundle.crt")
http.SetPort(port)
http.SetUrl(initUrl)

started = http.AsyncPostFromString( m.top.errorMsg)

while started
   if(started)
   
   
     print "started"
   
   
   end if
end while   

end sub