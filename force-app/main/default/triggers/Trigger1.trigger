trigger Trigger1 on Account (after update,after insert) {
Trigger1Class.Trigger1method(trigger.new);
}