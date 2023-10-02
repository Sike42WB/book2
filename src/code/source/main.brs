Library "v30/bslDefender.brs"

function Main(args as dynamic)
    m.args = args
    showMainScene()
end function    

function showMainScene() as void

    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")

    screen.setMessagePort(m.port)
    m.scene = screen.CreateScene("MainScene")

    m.deviceInfo = CreateObject("roDeviceInfo")
    m.deviceInfo.SetMessagePort(m.port)
    m.deviceInfo.EnableLinkStatusEvent(true)

    InitGlobals(screen) 

    screen.show()
    m.scene.observeField("out-request", m.port)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)

      if msgType = "roDeviceInfoEvent" 
          if (msg.isStatusMessage() = true) 
              ' TODO : Needs to test in detail for internet lost cases'
              m.scene.DeviceStatusInfo = msg.GetInfo()
          end if

          'end custom code
      else if msgType = "roSGScreenEvent"
          if msg.isScreenClosed()
              return
          end if
      else if msgType = "roSGNodeEvent"
          ' print "----------------------------------------"
          ' print "main.brs : received : " msgType
          ' print "main.brs : msg.getField() : " msg.GetField()
          ' print "----------------------------------------"
          ' When The AppManager want to send command back to Main
          if (msg.GetField() = "outRequest")
              request = msg.GetData()
              if (request <> invalid)
                  if (request.DoesExist("ExitApp") AND (request.ExitApp = true))
                      print "main.brs : ExitApp requested : Closing Application"
                      screen.close()
                  end if
              end if
          end if
      end if
    end while
end function