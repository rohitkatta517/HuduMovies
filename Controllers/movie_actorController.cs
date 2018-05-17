using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using HuduMovie.Models;

namespace HuduMovie.Controllers
{
    public class movie_actorController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/movie_actor
        public IQueryable<movie_actor> Getmovie_actor()
        {
            return db.movie_actor;
        }

        // GET: api/movie_actor/5
        [ResponseType(typeof(movie_actor))]
        public async Task<IHttpActionResult> Getmovie_actor(int id)
        {
            movie_actor movie_actor = await db.movie_actor.FindAsync(id);
            if (movie_actor == null)
            {
                return NotFound();
            }

            return Ok(movie_actor);
        }

        // PUT: api/movie_actor/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putmovie_actor(int id, movie_actor movie_actor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movie_actor.movie_actor_cast)
            {
                return BadRequest();
            }

            db.Entry(movie_actor).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!movie_actorExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/movie_actor
        [ResponseType(typeof(movie_actor))]
        public async Task<IHttpActionResult> Postmovie_actor(movie_actor movie_actor)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.movie_actor.Add(movie_actor);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = movie_actor.movie_actor_cast }, movie_actor);
        }

        // DELETE: api/movie_actor/5
        [ResponseType(typeof(movie_actor))]
        public async Task<IHttpActionResult> Deletemovie_actor(int id)
        {
            movie_actor movie_actor = await db.movie_actor.FindAsync(id);
            if (movie_actor == null)
            {
                return NotFound();
            }

            db.movie_actor.Remove(movie_actor);
            await db.SaveChangesAsync();

            return Ok(movie_actor);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool movie_actorExists(int id)
        {
            return db.movie_actor.Count(e => e.movie_actor_cast == id) > 0;
        }
    }
}