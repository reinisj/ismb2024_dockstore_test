version 1.0
workflow HelloInput {
    input {
        String name_input
    }
    call WriteGreeting {
        input:
            name_for_greeting = name_input
    }
    output {
        File final_output = WriteGreeting.Greeting_output
    }
}

task WriteGreeting {
   input {
       String name_for_greeting
   }
   command <<< 
       echo 'Hello Hawara ~{name_for_greeting}!' > greetings.txt
   >>>
   output {
       File Greeting_output = "greetings.txt"
   }
   runtime {
       docker: "ubuntu:latest"
   }
}