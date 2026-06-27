
import sdl;
import sdl.events;
import sdl.video;
import sdl.error;
import sdl.init;



import std.stdio;
import core.thread;

    SDL_Window* window = null;
    SDL_Event event;
   int windowWidth = 800;
    int windowHeight = 600;
    bool running = true;

void main() {
    // No loadSDL() function exists or is needed when using static subconfigurations

   init_SDL();
   init_Window();
   scope(exit) cleanup();
  
  while (running) {
            while (SDL_PollEvent(&event)) {
                if (event.type == SDL_EventType.SDL_EVENT_QUIT) {
                    running = false;
                }
            }
            // Regulates CPU usage loop
            Thread.sleep(16.msecs); 
        }
}

void init_SDL() {
        // Direct C-style call allowed by static bindings
        if (!SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO)) {
            writeln("Failed to initialize SDL: ", SDL_GetError());
        }
    }


    void init_Window() {
        window = SDL_CreateWindow("OpenGL with SDL3", windowWidth, windowHeight, SDL_WindowFlags.SDL_WINDOW_OPENGL);
        
        if (window is null) {
            writeln("Failed to create window: ", SDL_GetError());
            return;
        }

    }


  void cleanup() {
        if (window !is null) {
            SDL_DestroyWindow(window);
        }
        SDL_Quit();
    }