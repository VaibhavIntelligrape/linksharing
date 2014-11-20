package linksharing



class MyJob {
    static triggers = {
     // simple startDelay: 60000 repeatInterval: 2000l // execute job once in 5 seconds .will wait for 1 minute and after that will call the 'execute' method every second.
        cron name: 'myTrigger', cronExpression: "0 59 14 ? * Thu"
    }

    def execute() {
        // execute job
        println( "Output through  cron job ....")
    }
}
