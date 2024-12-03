import java.io.*;
import java.net.*;
class SocketClient {
  public static void main(String[] args) {
    // クライアントソケットを生成
    try (Socket socket = new Socket("localhost", 10000);
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"), true);
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
        // キーボード入力用のリーダーの作成
        BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in, "UTF-8"))) {
      // 「exit」を入力するまで繰り返し
      while (true) {
        System.out.print("IN>");
        String input = keyboard.readLine();
        writer.println(input);
        if (input.equals("exit")) {
          break;
        }
        System.out.println("[サーバーからの応答]" + reader.readLine());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}