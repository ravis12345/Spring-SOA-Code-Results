public class PostManHttpCallout {
    public  void PostManHttpCallout(){
        try{
            HttpRequest req = new HttpRequest();
            HttpResponse res = new HttpResponse();
            Http http = new Http();
            req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
            req.setMethod('GET');
            res = http.send(req);
            if(res.getstatusCode() == 200 && res.getbody() != null){ 
                system.debug('get response :'+res.getBody());
            system.debug('res::::: '+res.getStatusCode());

            }
            
        }catch(Exception ex){
            system.debug('error messasge::::: '+ex.getMessage()+'at linw Number:::::: '+ex.getLineNumber());
        }
        
        
    }
    
}