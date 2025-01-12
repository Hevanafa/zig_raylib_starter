const std = @import("std");
const rl = @import("raylib");

const sw = 640;
const sh = 360;

const cornflowerblue = rl.Color.init(0x64, 0x95, 0xed, 0xff);

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Starting Raylib with Zig...\n", .{});

    rl.initWindow(sw, sh, "raylib-zig Starter");

    // Textures must be loaded after window init because the OpenGL context is required

    const img = try rl.loadImage("assets/images/raylib_logo.png");
    const raylib_logo = try rl.loadTextureFromImage(img);
    rl.unloadImage(img);

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        rl.clearBackground(cornflowerblue);

        rl.drawTexture(
            raylib_logo,
            @divFloor((sw - raylib_logo.width), 2), 20,
            rl.Color.white);

        rl.drawText("Hello Raylib ++ Zig!", 20, sh - 100, 36, rl.Color.ray_white);
        rl.drawText("Esc - Close", 20, sh - 40, 12, rl.Color.ray_white);
        rl.endDrawing();
    }

    rl.unloadTexture(raylib_logo);
    rl.closeWindow();
}
