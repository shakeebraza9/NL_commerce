"use client"
import { useState, useEffect, useRef } from "react"
import { MessageCircle, X, Send } from "lucide-react"
import Echo from "laravel-echo";
import Pusher from "pusher-js";
import toast from "react-hot-toast"
export default function SupportWidget() {
  const [open, setOpen] = useState(false)
  const [message, setMessage] = useState("")
  const [ip, setIp] = useState("")
  const [messages, setMessages] = useState([])
  const messagesEndRef = useRef(null)

  // Scroll to bottom helper
  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" })
  }


  useEffect(() => {
    const fetchIpAndMessages = async () => {
      try {
        const res = await fetch("https://api.ipify.org?format=json")
        const data = await res.json()
        setIp(data.ip)

        const msgRes = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/support-message/${data.ip}/find`)
        const msgData = await msgRes.json()
        if (msgData.status && msgData.data) {
          setMessages(msgData.data)
        }
      } catch (err) {
        console.error("Failed to fetch data:", err)
      }
    }
    fetchIpAndMessages()
  }, [])


useEffect(() => {
  if (!ip) return;

  window.Pusher = Pusher;

  const echo = new Echo({
    broadcaster: "pusher",
    key: process.env.NEXT_PUBLIC_PUSHER_KEY,
    cluster: process.env.NEXT_PUBLIC_PUSHER_CLUSTER,
    forceTLS: true,
  });

  const safeIp = ip.replace(/\./g, "_");
  const supportChannel = echo.channel(`support.${safeIp}`);

  supportChannel.listen('.support.replied', (data) => {
    // console.log("📩 New reply received:", data);

    setMessages((prevMessages) => {
      const index = prevMessages.findIndex((msg) => msg.id === data.id);
      if (index !== -1) {
        const updated = [...prevMessages];
        updated[index] = { ...updated[index], reply: data.reply, status: data.status };
         if (data.reply) {
           toast.success("Admin update a message");

          // Play sound
          const audio = new Audio("/sounds/ding.mp3");
          audio.play();
        }
        return updated;
      } else {
        
        if (data.reply) {
           toast.success("Admin send a message");

          // Play sound
          const audio = new Audio("/sounds/ding.mp3");
          audio.play();
        }
        return [...prevMessages, data];
      }
    });
  });

  return () => {
    echo.leaveChannel(`support.${safeIp}`);
  };
}, [ip]);


  // Scroll to bottom whenever messages change
  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  // Send user message
  const handleSend = async () => {
  if (!message.trim()) return;

  try {
    const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/support-message`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ip_address: ip,
        message: message,
      }),
    });

    if (!res.ok) throw new Error("Failed to send message");

    setMessage(""); // Clear input
    toast.success("✅ Message sent! Wait for admin reply."); // Show toast
  } catch (error) {
    console.error("Error sending message:", error);
    toast.error("❌ Failed to send message."); // Show error toast
  }
};


  return (
    <div className="fixed bottom-6 right-6 z-50">
      {/* Chat Icon Button */}
      <button
        onClick={() => setOpen(!open)}
        className="bg-black text-white p-4 rounded-full shadow-2xl hover:bg-gray-800 transition-all duration-300 hover:scale-105 border-2 border-gray-200"
      >
        {open ? <X size={24} /> : <MessageCircle size={24} />}
      </button>

      {/* Chat Box */}
      {open && (
        <div className="absolute bottom-16 right-0 w-80 bg-white shadow-2xl rounded-2xl border-2 border-black overflow-hidden flex flex-col">
          {/* Header */}
          <div className="bg-black text-white p-4 border-b border-gray-200">
            <h3 className="text-lg font-bold">Support Chat</h3>
            <p className="text-sm text-gray-300">We're here to help you 24/7</p>
          </div>

          {/* Chat Messages */}
          <div className="flex-1 p-4 space-y-3 overflow-y-auto max-h-80">
            <div className="bg-gray-100 p-3 rounded-lg border border-gray-300">
              <p className="text-sm text-gray-800">👋 Hello! How can we assist you today?</p>
            </div>

            {messages.map((msg) => (
              <div key={msg.id} className="space-y-2">
                {/* User Message */}
                <div className="flex justify-end">
                  <div className="bg-yellow-300 text-black p-2 rounded-lg text-sm max-w-[75%]">
                    {msg.message}
                  </div>
                </div>

                {/* Admin Reply */}
                {msg.reply && (
                  <div className="flex justify-start">
                    <div className="bg-black text-white p-2 rounded-lg text-sm max-w-[75%]">
                      {msg.reply}
                    </div>
                  </div>
                )}
              </div>
            ))}
            <div ref={messagesEndRef}></div>
          </div>

          {/* Message Input */}
          <div className="p-3 border-t border-gray-200 space-y-2">
            <textarea
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              placeholder="Type your message here..."
              className="w-full border-2 border-gray-300 rounded-lg p-2 text-sm focus:outline-none focus:border-black focus:ring-2 focus:ring-gray-200 resize-none transition-all duration-200"
              rows={2}
              onKeyPress={(e) => {
                if (e.key === "Enter" && !e.shiftKey) {
                  e.preventDefault()
                  handleSend()
                }
              }}
            />

            <button
              onClick={handleSend}
              disabled={!message.trim()}
              className="w-full bg-black text-white py-2 rounded-lg font-semibold hover:bg-gray-800 transition-all duration-200 flex items-center justify-center gap-2 disabled:bg-gray-400 disabled:cursor-not-allowed border-2 border-black hover:border-gray-800"
            >
              <Send size={16} />
              Send
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
