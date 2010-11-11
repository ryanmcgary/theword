xml.instruct!
xml.Response do
    xml.Gather(:action => @record, :numDigits => 1) do
        xml.Say "We will now replay your message. Press 1 at any time to re-record. Hangup to save and disconnect"
        xml.Play @recordingurl
    end                                                                                               
    xml.Redirect @editrecording 
end