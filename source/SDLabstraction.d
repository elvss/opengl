import bindbc.sdl;

struct SDL_abstraction
{
    int windowWidth = 800;
    int windowHeight = 600;
    bool running = true;

    SDL_Window* window;
    SDL_Event event;

    void init_SDL()
    {
        SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO | SDL_INIT_EVENTS);
    }

    void init_Window()
    {
        window = SDL_CreateWindow("OpenGL with SDL3", windowWidth, windowHeight, SDL_WINDOW_OPENGL);

        while (running)
        {
            while (SDL_PollEvent(&event))
            {
                if (event.type == SDL_EVENT_QUIT)
                {
                    running = false;
                }
            }
        }
    }
}