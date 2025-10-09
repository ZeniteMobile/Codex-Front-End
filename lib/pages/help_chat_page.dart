import 'package:flutter/material.dart';

class HelpChatPage extends StatelessWidget {
  const HelpChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Colors.grey.shade50;
    final Color botBubbleColor = Colors.grey.shade200;
    final Color userBubbleColor = Colors.deepPurple.shade50;
    final Color userSuggestionBubbleColor = Colors.deepPurple.shade100;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Help Chat',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildBotMessage('--- ------'),
                _buildUserMessage('-----'),
                _buildBotMessage('--- ------ -- -----'),
                _buildBotMessage('----'),
                _buildCardMessage(),
                _buildBotMessage('-- ----'),
              ],
            ),
          ),
          _buildSuggestionChips(userSuggestionBubbleColor),
          _buildInputBar(botBubbleColor),
        ],
      ),
    );
  }

  Widget _buildBotMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 16,
            child: const Icon(
              Icons.smart_toy_outlined,
              size: 20,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(text, style: const TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 60),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Text(text, style: TextStyle(color: Colors.deepPurple.shade900)),
      ),
    );
  }

  Widget _buildCardMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 40),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.change_history, color: Colors.white, size: 40),
                    Icon(Icons.star_border, color: Colors.white, size: 40),
                    Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 10, width: 100, color: Colors.grey.shade300),
            const SizedBox(height: 6),
            Container(height: 10, width: 150, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade800,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                '---- ------ -----',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChips(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildChip(color, '--- ----'),
          const SizedBox(width: 8),
          _buildChip(color, '----'),
          const SizedBox(width: 8),
          _buildChip(color, '----'),
        ],
      ),
    );
  }

  Widget _buildChip(Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(text, style: TextStyle(color: Colors.deepPurple.shade900)),
    );
  }

  Widget _buildInputBar(Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black54,
                ),
                onPressed: () {},
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '---',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
