<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chatbot</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .chat-container {
            width: 100%;
            max-width: 800px;
            height: 90%;
            display: flex;
            flex-direction: column;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 0.3s ease-out;
        }
        #chatbox {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            border-bottom: 2px solid #ddd;
            display: flex;
            flex-direction: column;
            gap: 10px;
            transition: 0.3s ease-in-out;
        }
        .user, .bot {
            padding: 12px 18px;
            border-radius: 20px;
            max-width: 75%;
            word-wrap: break-word;
            transition: all 0.3s ease-in-out;
        }
        .user {
            background: #007bff;
            color: white;
            align-self: flex-end;
            text-align: right;
            border-radius: 20px 20px 0 20px;
        }
        .bot {
            background: #e5e5ea;
            color: black;
            align-self: flex-start;
            text-align: left;
            border-radius: 20px 20px 20px 0;
        }
        .input-area {
            display: flex;
            padding: 10px;
            background: #fff;
            border-top: 2px solid #ddd;
        }
        input {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 30px;
            font-size: 18px;
            outline: none;
            transition: 0.3s ease-in-out;
        }
        input:focus {
            box-shadow: 0px 0px 10px rgba(0, 123, 255, 0.5);
        }
        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 15px 25px;
            margin-left: 10px;
            border-radius: 30px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease-in-out;
        }
        button:hover {
            background: #0056b3;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

    <div class="chat-container">
        <div id="chatbox"></div>
        <div class="input-area">
            <input type="text" id="userInput" placeholder="Type your message..." />
            <button id="send">Send</button>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#send").click(function () {
                var userText = $("#userInput").val().trim();
                if (userText === "") return;

                // Display user's message
                $("#chatbox").append("<div class='user'><b>You:</b> " + userText + "</div>");
                $("#userInput").val(""); // Clear the input field

                // Send user's message to the bot and get response
                $.ajax({
                    url: "/bot/chat",
                    type: "GET",
                    data: { prompt: userText },
                    success: function (response) {
                        $("#chatbox").append("<div class='bot'><b>Bot:</b> " + response + "</div>");
                        $("#chatbox").scrollTop($("#chatbox")[0].scrollHeight); // Scroll to the bottom
                    },
                    error: function () {
                        $("#chatbox").append("<div class='bot'><b>Bot:</b> Error retrieving response.</div>");
                    }
                });
            });

            // Enable sending messages on Enter key press
            $("#userInput").keypress(function (e) {
                if (e.which == 13) { 
                    $("#send").click(); 
                }
            });
        });
    </script>

</body>
</html>
