﻿using System;
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
    public class moviesController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/movies
        public IQueryable<movie> Getmovies()
        {
            return db.movies;
        }

        // GET: api/movies/5
        [ResponseType(typeof(movie))]
        public async Task<IHttpActionResult> Getmovie(int id)
        {
            movie movie = await db.movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }

        // PUT: api/movies/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putmovie(int id, movie movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movie.movie_id)
            {
                return BadRequest();
            }

            db.Entry(movie).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!movieExists(id))
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

        // POST: api/movies
        [ResponseType(typeof(movie))]
        public async Task<IHttpActionResult> Postmovie(movie movie)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.movies.Add(movie);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = movie.movie_id }, movie);
        }

        // DELETE: api/movies/5
        [ResponseType(typeof(movie))]
        public async Task<IHttpActionResult> Deletemovie(int id)
        {
            movie movie = await db.movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            db.movies.Remove(movie);
            await db.SaveChangesAsync();

            return Ok(movie);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool movieExists(int id)
        {
            return db.movies.Count(e => e.movie_id == id) > 0;
        }
    }
}