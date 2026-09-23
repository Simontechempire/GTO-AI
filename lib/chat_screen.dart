import 'package:flutter/material.dart';
import 'services/ai_service.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [];

  bool isLoading = false;

  Future<void> sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty || isLoading) return;

    setState(() {
      messages.add({
        'text': text,
        'isUser': true,
      });

      isLoading = true;
    });

    _controller.clear();

    final response = await AIService.sendMessage(text);

    if (!mounted) return;

    setState(() {
      messages.add({
        'text': response,
        'isUser': false,
      });

      isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GTO AI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(
                    child: Text(
                      'Ask GTO anything 🤖',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return ChatBubble(
                        message: message['text'],
                        isUser: message['isUser'],
                      );
                    },
                  ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('GTO is thinking...'),
            ),

          MessageInput(
            controller: _controller,
            onSend: sendMessage,
          ),
        ],
      ),
    );
  }
}
